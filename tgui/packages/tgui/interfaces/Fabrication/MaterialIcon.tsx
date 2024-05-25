import { Icon, Image } from '../../components';
import { Material } from './Types';

export type MaterialIconProps = {
  material: Material;
};

/**
 * A 32x32 material icon. Animates between different stack sizes of the given
 * material.
 */
export const MaterialIcon = (props: MaterialIconProps) => {
  const { material } = props;

  if (!material.icon) {
    return <Icon name="question-circle" />;
  }

  return <Image className="FabricatorMaterialIcon" src={material.icon} />;
};
