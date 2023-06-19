export interface ICollection {
  id: number;
  name: string;
  date: string;
  association_name: string;
  dynamic_attributes: { [key: string]: string };
}
